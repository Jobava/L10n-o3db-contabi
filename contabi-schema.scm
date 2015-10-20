(table acc
  (name (de "Konto") (en "Account") (ro "Cont"))
  (fields 
      (number id     (width  5) (name "Id"))
      (string name   (width 25) (name "Name"))
      (number vatid  (width  5) (name (de "Steuerkonto") (en "Vat Account") (ro "Cont TVA")))
      (fix2   vatper (width  5) (name (de "Prozentsatz") (en "Percentage") (ro "Procent"))))
  (primary id)
  (joined
      (string vatnam (width 25) (name (de "Steuerkonto") (en "Vat Account") (ro "Cont TVA"))))
  (foreign (vatid acc.id)))

(table sld
  (name (de "Salden") (en "Totals") (ro "Totaluri"))
  (fields 
      (number id     (width  5) (name "Id"))
      (fix2 period   (width  7) (name (de "Periode") (en "Period") (ro "Perioada")))
      (fix2 debit    (width 12) (name (de "Soll") (en "Debit") (ro "Debit")))
      (fix2 credit   (width 12) (name (de "Haben") (en "Credit") (ro "Credit")))
      (fix2 saldo    (width 12) (name (de "Saldo") (en "Total") (ro "Total"))))
  (primary id period)
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account") (ro "Cont"))))
  (foreign (id acc.id)))

(table prl
  (name (de "Primanota") (en "Pretty Book") (ro "Registru intrări" #;( fuzzy ) ))
  (fields
      (number id     (width 10) (name "Id"))
      (date   dat    (width 10) (name (de "Datum") (en "Date") (ro "Data")))
      (number acc    (width  5) (name (de "Konto") (en "Account") (ro "Cont"))
                                (short "#"))
      (number con    (width  5) (name (de "Gegenkonto") (en "Contra") (ro "Contra cont" #;( fuzzy ) ))
                                (short "#"))
      (fix2   moa    (width 12) (name (de "Betrag") (en "Amount") (ro "Cantitate")))
      (string ref    (width 25) (name (de "Beleg") (en "Reference") (ro "Referință")))
      (string txt    (width 25) (name "Text")))
  (primary id)
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account") (ro "Cont")))
      (string connam (width 25) (name (de "Gegenkonto") (en "Contra") (ro "Contra cont" #;( fuzzy ) ))))
  (foreign (acc acc.id)
           (con acc.id)))

(table jrl
  (name (de "Journal") (en "Journal") (ro "Jurnal"))
  (fields
      (number id         (width 10) (name "Id"))
      (date   dat    (width 10) (name (de "Datum") (en "Date") (ro "Data")))
      (number acc    (width  5) (name (de "Konto") (en "Account") (ro "Cont")))
      (number con    (width  5) (name (de "Gegenkonto") (en "Contra") (ro "Contra cont" #;( fuzzy ) )))
      (fix2   moa    (width 12) (name (de "Betrag") (en "Amount") (ro "Cantitate")))
      (string ref    (width 25) (name (de "Beleg") (en "Reference") (ro "Referință")))
      (string txt    (width 25) (name "Text")))
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account") (ro "Cont"))))
  (foreign (acc acc.id)
           (con acc.id)))

(table acl
  (name (de "Kontenblatt") (en "Account Ledger") (ro "Registru conturi"))
  (fields
      (number id         (width 10) (name "Id"))
      (date   dat    (width 10) (name (de "Datum") (en "Date") (ro "Data")))
      (number acc    (width  5) (name (de "Konto") (en "Account") (ro "Cont")))
      (number con    (width  5) (name (de "Gegenkonto") (en "Contra") (ro "Contra cont" #;( fuzzy ) )))
      (fix2   moa    (width 12) (name (de "Betrag") (en "Amount") (ro "Cantitate")))
      (string ref    (width 25) (name (de "Beleg") (en "Reference") (ro "Referință")))
      (string txt    (width 25) (name "Text")))
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account") (ro "Cont"))))
  (foreign (acc acc.id)
           (con acc.id)))
