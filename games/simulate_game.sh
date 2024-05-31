#!/bin/bash

# Read the markdown file and parse the decks
blue_deck=$(grep -A12 "## Blue Deck" cards.md | tail -n +4 | head -n -1)
red_deck=$(grep -A10 "## Red Deck" cards.md | tail -n +4 | head -n -1)

# Initialize CIA points
confidentiality=3
integrity=3
availability=3

# Function to parse card details
parse_card() {
    local card_line="$1"
    local card_type="$2"
    IFS='|' read -ra card_parts <<< "$card_line"
    local card_name=$(echo "${card_parts[1]}" | xargs)
    local card_stats=$(echo "${card_parts[2]}" | xargs)

    echo "$card_type: $card_name - Stats: $card_stats"
    if [[ $card_type == "Red" ]]; then
        if [[ $card_stats == *"Confidentiality"* ]]; then
            local damage=$(echo $card_stats | grep -oP '\-\d+ Confidentiality' | grep -oP '\-\d+')
            confidentiality=$((confidentiality + damage))
        fi
        if [[ $card_stats == *"Integrity"* ]]; then
            local damage=$(echo $card_stats | grep -oP '\-\d+ Integrity' | grep -oP '\-\d+')
            integrity=$((integrity + damage))
        fi
        if [[ $card_stats == *"Availability"* ]]; then
            local damage=$(echo $card_stats | grep -oP '\-\d+ Availability' | grep -oP '\-\d+')
            availability=$((availability + damage))
        fi
    else
        if [[ $card_stats == *"Confidentiality"* ]]; then
            local benefit=$(echo $card_stats | grep -oP '\+\d+ Confidentiality' | grep -oP '\+\d+')
            confidentiality=$((confidentiality + benefit))
        fi
        if [[ $card_stats == *"Integrity"* ]]; then
            local benefit=$(echo $card_stats | grep -oP '\+\d+ Integrity' | grep -oP '\+\d+')
            integrity=$((integrity + benefit))
        fi
        if [[ $card_stats == *"Availability"* ]]; then
            local benefit=$(echo $card_stats | grep -oP '\+\d+ Availability' | grep -oP '\+\d+')
            availability=$((availability + benefit))
        fi
    fi
}

# Function to simulate a turn
simulate_turn() {
    local turn=$1
    echo "Turn $turn"

    # Draw a random card from each deck
    local blue_card=$(echo "$blue_deck" | shuf -n 1)
    local red_card=$(echo "$red_deck" | shuf -n 1)

    # Parse and apply the effects of each card
    parse_card "$blue_card" "Blue"
    parse_card "$red_card" "Red"

    # Show updated CIA points
    echo "Confidentiality: $confidentiality, Integrity: $integrity, Availability: $availability"
    echo ""
}

# Simulate a fixed number of turns
num_turns=5
for (( turn=1; turn<=num_turns; turn++ )); do
    simulate_turn $turn
done

# Check final state
if [[ $confidentiality -le 0 || $integrity -le 0 || $availability -le 0 ]]; then
    echo "Red team wins!"
else
    echo "Blue team wins!"
fi
