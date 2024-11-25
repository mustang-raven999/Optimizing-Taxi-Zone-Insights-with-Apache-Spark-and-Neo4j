### Task 0

MATCH (z1:zone)-[r:CONNECTS]->(z2:zone)
WHERE z1=z2
return z1.name 

### TASK 1

# Graph Projection
Call gds.graph.create('c2052473-community', 'zone',{CONNECTS:{ orientation: 'UNDIRECTED'}},{relationshipProperties:'trips'})


# Stat Mode

CALL gds.louvain.stats('c2052473-community')
YIELD communityCount

communityCount : 5

# Stream Mode

CALL gds.louvain.stream('c2052473-community',{relationshipWeightProperty: 'trips' })
YIELD nodeId, communityId, intermediateCommunityIds
RETURN gds.util.asNode(nodeId).id AS zone_id, communityId
ORDER BY zone_id ASC


### TASK 2

# Graph Projection
Call gds.graph.create('c2052473-centrality', 'zone',{CONNECTS:{ orientation: 'NATURAL'}},{relationshipProperties:'trips'})


# Stat Mode

CALL gds.pageRank.stats('c2052473-centrality') 
YIELD centralityDistribution

"min"	: 0.15777301788330078
"max"	: 1.7627248764038086
"mean": 0.9612405180470823

# Stream Mode

CALL gds.pageRank.stream('c2052473-centrality',{relationshipWeightProperty: 'trips'})
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).id AS zone_id, score AS centrality_score
ORDER BY centrality_score DESC, zone_id ASC


### TASK 3a 

# With Manhattan

MATCH (y:zone)
WITH y
ORDER BY y.centrality DESC
WITH y.community as community, COLLECT(y.id)[..3] as top_three
UNWIND top_three as zone_id
RETURN zone_id,community


### TASK 3b 

# Without Manhattan

MATCH (y:zone)
WHERE (EXISTS{MATCH (y)-[:IN]->(b:borough) WHERE b.name <> "Manhattan"})
WITH y.community AS community_id,y.id AS zoneid, y.centrality AS centralityscore
ORDER BY community_id, centralityscore
WITH COLLECT(zoneid) AS zid, community_id UNWIND (zid[0..3]) AS zone_id 
RETURN zone_id,community_id


