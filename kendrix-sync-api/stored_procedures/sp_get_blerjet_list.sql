DELIMITER //

CREATE PROCEDURE sp_get_blerjet_list(
    IN p_tenant_id INT,
    IN p_from DATE,
    IN p_to DATE
)
BEGIN
  SELECT
    b.NrFatures                                      AS NrFatures,
    b.DataEFatures                             AS `Data`,
    s.Emertimi                                       AS Subjekti,
    SUM(peb.CmimiNjesi * IFNULL(peb.Sasia, 1))       AS Totali
  FROM Blerjet b
  LEFT JOIN Subjektet s
         ON s.tenant_id = b.tenant_id AND s.Id = b.SubjektiId
  INNER JOIN PorositeEBlerjes peb
         ON peb.tenant_id = b.tenant_id AND peb.BlerjaId = b.Id
        AND (peb.Fshire IS NULL OR peb.Fshire = 0)
  WHERE b.tenant_id = p_tenant_id
    AND (b.Fshire IS NULL OR b.Fshire = 0)
    AND (p_from IS NULL OR DATE(b.DataEFatures) >= p_from)
    AND (p_to   IS NULL OR DATE(b.DataEFatures) <= p_to)
  GROUP BY
    b.Id,
    b.NrFatures,
    DATE(b.DataEFatures),
    s.Emertimi
  ORDER BY `Data` DESC;
END //

DELIMITER ;