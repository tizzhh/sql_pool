WITH RECURSIVE r AS (
  SELECT 
    point1, 
    point2, 
    cost, 
    cost AS total_cost, 
    array [point1] AS tour, 
    1 AS level, 
    false AS already_been 
  FROM 
    ex00_TSP 
  WHERE 
    point1 = 'a' 
  UNION 
  SELECT 
    ex00_TSP.point1, 
    ex00_TSP.point2, 
    ex00_TSP.cost, 
    CASE WHEN (
      SELECT 
        ARRAY_LENGTH(tour, 1)
    ) < 4 THEN ex00_TSP.cost + r.total_cost 
    ELSE r.total_cost 
    END AS total_cost, 
    r.tour || ex00_TSP.point1, 
    r.level + 1 AS level, 
    ex00_TSP.point1 = ANY(r.tour) 
  FROM 
    ex00_TSP 
    JOIN r ON ex00_TSP.point1 = r.point2 
    AND (
      NOT ex00_TSP.point1 = ANY(r.tour) 
      OR (
        ex00_TSP.point1 = 'a' 
        AND (
          SELECT 
            ARRAY_LENGTH(tour, 1)
        ) = 4
      )
    ) 
  WHERE 
    level < 5
) 
SELECT 
  DISTINCT total_cost, 
  tour 
FROM 
  r 
WHERE 
  level = 5;