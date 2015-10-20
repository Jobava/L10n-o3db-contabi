(rows acc-rows (over acc)
    (fields acc.id acc.name acc.vatid acc.vatnam acc.vatper))
(form acc-form 
    (name (de "Kontenstammdaten") (en "Account Data"))
    (keys acc-load acc-save acc-search)
    (fields acc-rows))

(list acc-cols (over acc) (max 12)
    (keys acc-return)
    (fields acc.id acc.name))
(form acc-list 
    (name (de "Kontenliste") (en "Account Listing"))
    (fields acc-cols))

(proc acc-load (name (de "Laden") (en "Load")) (enter acc.id))
(proc acc-save (name (de "Speichern") (en "Save")) (key 2))
(proc acc-search (name (de "Suchen") (en "Search")) (key 3)
    (on acc.name prl.accnam prl.connam))
(proc acc-return (name "Ok") (enter acc.id))

(rows sld-rows (over sld)
    (fields sld.id sld.accnam sld.period sld.debit sld.credit sld.saldo))
(cols sld-cols (over sld) (max 12)
    (fields sld.id sld.accnam sld.period sld.debit sld.credit sld.saldo))
(form sld-form 
    (name (de "Salden") (en "Totals"))
    (fields sld-rows))
(form sld-list 
    (name (de "Salden") (en "Totals"))
    (fields sld-cols))

(table prs (fields (fix2 sum (name (de "Summe") (en "Total")) (width 12))))

(cols prl-edit (over prl) (max 12)
    (fields prl.dat (prl.acc prl.con) (prl.accnam prl.connam)
            (prl.ref prl.txt) prl.moa)
    (keys prl-acc prl-con acc-search prl-moa))
(rows prl-sum (class "right") (fields prs.sum))

(form prl-form 
    (name (de "Primanota") (en "Pretty Book"))
    (fields prl-edit prl-sum))

(proc prl-acc (name (de "Laden") (en "Load")) (enter prl.acc))
(proc prl-con (name (de "Laden") (en "Load")) (enter prl.con))
(proc prl-moa (name (de "Berechnen") (en "Calculate")) (enter prl.moa))

(menu contabi
    (name "Contabi")
    (fields acc-form #;sld-form prl-form))
