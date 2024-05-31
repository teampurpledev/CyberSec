#!/bin/bash

# Check if yq is installed
if ! command -v yq &> /dev/null; then
    echo "yq could not be found, please install yq to continue."
    exit 1
fi

# Initialize CIA points
confidentiality=3
integrity=3
availability=3

# Read and parse YAML files
blue_deck=$(yq e '.blue_deck' blue.yml)
red_deck=$(yq e '.red_deck' red.yml)

# Function to parse and apply card effects
apply_card_effects() {
    local card="$1"
    local type="$2"

    local c_stat
    local i_stat
    local a_stat

    if [[ $type == "Blue" ]]; then
        c_stat=$(echo "$card" | yq e '.cia_stats.c' -)
        i_stat=$(echo "$card" | yq e '.cia_stats.i' -)
        a_stat=$(echo "$card" | yq e '.cia_stats.a' -)
    else
        c_stat=$(echo "$card" | yq e '.cia_stats_impact.c' -)
        i_stat=$(echo "$card" | yq e '.cia_stats_impact.i' -)
        a_stat=$(echo "$card" | yq e '.cia_stats_impact.a' -)
    fi

    confidentiality=$((confidentiality + c_stat))
    integrity=$((integrity + i_stat))
    availability=$((availability + a_stat))
}

# Function to simulate a turn
simulate_turn() {
    local turn=$1
    echo "Turn $turn"

    # Draw a random card from each deck
    local blue_card=$(echo "$blue_deck" | yq e '.[env(blue_idx)]' -)
    local red_card=$(echo "$red_deck" | yq e '.[env(red_idx)]' -)

    echo "Blue card: $(echo "$blue_card" | yq e '.role_name' -)"
    echo "Red card: $(echo "$red_card" | yq e '.ttp_name' -)"

    # Apply card effects
    apply_card_effects "$blue_card" "Blue"
    apply_card_effects "$red_card" "Red"

    # Show updated CIA points
    echo "Confidentiality: $confidentiality, Integrity: $integrity, Availability: $availability"
    echo ""

    # Check if any CIA point has reached 0 or lower
    if [[ $confidentiality -le 0 || $integrity -le 0 || $availability -le 0 ]]; then
        echo "Red team wins!"
        exit 0
    fi
}

# Simulate a fixed number of turns
num_turns=5
for (( turn=1; turn<=num_turns; turn++ )); do
    export blue_idx=$((RANDOM % 12))
    export red_idx=$((RANDOM % 10))
    simulate_turn $turn
done

# Check final state
echo "Final Confidentiality: $confidentiality, Integrity: $integrity, Availability: $availability"
if [[ $confidentiality -le 0 || $integrity -le 0 || $availability -le 0 ]]; then
    echo "Red team wins!"
else
    echo "Blue team wins!"
fi
