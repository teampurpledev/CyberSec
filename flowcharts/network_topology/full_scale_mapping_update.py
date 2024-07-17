import networkx as nx
import matplotlib.pyplot as plt
G = nx.Graph()

nodes = [
    ("WiFi Router", {"pos": (1, 8)}),
    ("Desktop PC", {"pos": (0, 9)}),
    ("Laptop", {"pos": (2, 9)}),
    ("Tablet", {"pos": (2, 7)}),
    ("Phone", {"pos": (1, 10)}),
    ("IP Phone", {"pos": (0, 7)}),
    ("Switch", {"pos": (1, 6)}),
    ("Firewall", {"pos": (1, 4)}),
    ("Router", {"pos": (1, 3)}),
    ("ISP Internet", {"pos": (2, 2)}),
    ("Cloud Storage", {"pos": (3, 2)}),
    ("Private Payment Network", {"pos": (0, 2)}),
    ("Central Server", {"pos": (3, 6)}),
    ("Backup External Hard Drive", {"pos": (3, 5)}),
    ("Monitoring System", {"pos": (1, 5)}),
    ("Auditing System", {"pos": (2, 4)})
]

G.add_nodes_from(nodes)

edges = [
    ("WiFi Router", "Desktop PC"),
    ("WiFi Router", "Laptop"),
    ("WiFi Router", "Tablet"),
    ("WiFi Router", "Phone"),
    ("WiFi Router", "IP Phone"),
    ("WiFi Router", "Switch"),
    ("Switch", "Firewall"),
    ("Firewall", "Router"),
    ("Router", "ISP Internet"),
    ("ISP Internet", "Cloud Storage"),
    ("Router", "Private Payment Network"),
    ("Switch", "Central Server"),
    ("Central Server", "Backup External Hard Drive"),
    ("Switch", "Monitoring System"),
    ("Switch", "Auditing System")
]

G.add_edges_from(edges)

pos = nx.get_node_attributes(G, 'pos')

# Draw the graph
plt.figure()
nx.draw(G, pos, node_size=4500, node_color="purple", edge_color="gray")
nx.draw_networkx_labels(G, pos, font_size=12, font_weight='bold')
plt.show()
