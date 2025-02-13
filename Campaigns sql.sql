SELECT 
  x."Campaign Name", 
  z."Account Name", 
  a."Campaign And Account Owner Name", 
  a."MID", 
  zSELECT 
  x."Campaign Name", 
  z."Account Name", 
  a."Campaign And Account Owner Name", 
  a."MID", 
  z."Business Industry (Sales Input)", 
  z."Business Sector (Sales Input)", 
  z."Account Status", 
  a."Campaign Status", 
  a."Created Time", 
  z.Team, 
  z."Valu TPV" AS Total_Valu_TPV, 
  z."Amaan TPV" AS Total_Amaan_TPV, 
  z."Souhoola TPV" AS Total_Souhoola_TPV, 
  (
    z."Souhoola TPV" + z."Valu TPV" + z."Amaan TPV"
  ) AS Total_TPV, 
  x.Status, 
  CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END AS "Status", 
  CASE WHEN COALESCE(
    CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END, 
    '0'
  ) = '1' THEN 'Service Activated' 
  /* If Status is 1*/
  WHEN COALESCE(
    a."Campaign Status", 
    CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END
  ) = '0' THEN 'Not Contacted' 
  /* If Status is 0 or NULL, return 'Not Contacted'*/
  ELSE COALESCE(
    a."Campaign Status", 
    CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END
  ) END AS Final_Status, 
  CASE WHEN x."Campaign Name" = 'ValU PF' THEN z."Valu TPV" WHEN x."Campaign Name" = 'Aman Activation' THEN z."Amaan TPV" WHEN x."Campaign Name" = 'Souhoola' THEN z."Souhoola TPV" ELSE 0 END AS Services_TPV 
FROM 
  "Campaigns And Accounts (Zoho CRM)" a 
  LEFT JOIN "Accounts (Zoho CRM)" z ON a."MID" = z."MID" 
  LEFT JOIN "Campaigns (Zoho CRM)" x ON x.Id = a."Campaign ID"."Business Industry (Sales Input)", 
  z."Business Sector (Sales Input)", 
  z."Account Status", 
  a."Campaign Status", 
  a."Created Time", 
  z.Team, 
  z."Valu TPV" AS Total_Valu_TPV, 
  z."Amaan TPV" AS Total_Amaan_TPV, 
  z."Souhoola TPV" AS Total_Souhoola_TPV, 
  (
    z."Souhoola TPV" + z."Valu TPV" + z."Amaan TPV"
  ) AS Total_TPV, 
  x.Status, 
  CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END AS "Status", 
  CASE WHEN COALESCE(
    CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END, 
    '0'
  ) = '1' THEN 'Service Activated' 
  /* If Status is 1*/
  WHEN COALESCE(
    a."Campaign Status", 
    CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END
  ) = '0' THEN 'Not Contacted' 
  /* If Status is 0 or NULL, return 'Not Contacted'*/
  ELSE COALESCE(
    a."Campaign Status", 
    CASE WHEN lower_case(x."Campaign Name") LIKE '%souhoola%' THEN z."Souhoola" WHEN lower_case(x."Campaign Name") LIKE '%aman%' THEN z."Amaan" WHEN lower_case(x."Campaign Name") LIKE '%valu%' THEN z."Valu" ELSE '0' END
  ) END AS Final_Status, 
  CASE WHEN x."Campaign Name" = 'ValU PF' THEN z."Valu TPV" WHEN x."Campaign Name" = 'Aman Activation' THEN z."Amaan TPV" WHEN x."Campaign Name" = 'Souhoola' THEN z."Souhoola TPV" ELSE 0 END AS Services_TPV 
FROM 
  "Campaigns And Accounts (Zoho CRM)" a 
  LEFT JOIN "Accounts (Zoho CRM)" z ON a."MID" = z."MID" 
  LEFT JOIN "Campaigns (Zoho CRM)" x ON x.Id = a."Campaign ID"