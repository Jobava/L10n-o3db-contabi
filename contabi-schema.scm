(table acc
  (name (de "Konto") (en "Account"))
  (fields 
      (number id     (width  5) (name "Id"))
      (string name   (width 25) (name "Name"))
      (number vatid  (width  5) (name (de "Steuerkonto") (en "Vat Account")))
      (fix2   vatper (width  5) (name (de "Prozentsatz") (en "Percentage"))))
  (primary id)
  (joined
      (string vatnam (width 25) (name (de "Steuerkonto") (en "Vat Account"))))
  (foreign (vatid acc.id)))

(table sld
  (name (de "Salden") (en "Totals"))
  (fields 
      (number id     (width  5) (name "Id"))
      (fix2 period   (width  7) (name (de "Periode") (en "Period")))
      (fix2 debit    (width 12) (name (de "Soll") (en "Debit")))
      (fix2 credit   (width 12) (name (de "Haben") (en "Credit")))
      (fix2 saldo    (width 12) (name (de "Saldo") (en "Total"))))
  (primary id period)
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account"))))
  (foreign (id acc.id)))

(table prl
  (name (de "Primanota") (en "Pretty Book"))
  (fields
      (number id     (width 10) (name "Id"))
      (date   dat    (width 10) (name (de "Datum") (en "Date")))
      (number acc    (width  5) (name (de "Konto") (en "Account"))
                                (short "#"))
      (number con    (width  5) (name (de "Gegenkonto") (en "Contra"))
                                (short "#"))
      (fix2   moa    (width 12) (name (de "Betrag") (en "Amount")))
      (string ref    (width 25) (name (de "Beleg") (en "Reference")))
      (string txt    (width 25) (name "Text")))
  (primary id)
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account")))
      (string connam (width 25) (name (de "Gegenkonto") (en "Contra"))))
  (foreign (acc acc.id)
           (con acc.id)))

(table jrl
  (name (de "Journal") (en "Journal"))
  (fields
      (number id         (width 10) (name "Id"))
      (date   dat    (width 10) (name (de "Datum") (en "Date")))
      (number acc    (width  5) (name (de "Konto") (en "Account")))
      (number con    (width  5) (name (de "Gegenkonto") (en "Contra")))
      (fix2   moa    (width 12) (name (de "Betrag") (en "Amount")))
      (string ref    (width 25) (name (de "Beleg") (en "Reference")))
      (string txt    (width 25) (name "Text")))
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account"))))
  (foreign (acc acc.id)
           (con acc.id)))

(table acl
  (name (de "Kontenblatt") (en "Account Ledger"))
  (fields
      (number id         (width 10) (name "Id"))
      (date   dat    (width 10) (name (de "Datum") (en "Date")))
      (number acc    (width  5) (name (de "Konto") (en "Account")))
      (number con    (width  5) (name (de "Gegenkonto") (en "Contra")))
      (fix2   moa    (width 12) (name (de "Betrag") (en "Amount")))
      (string ref    (width 25) (name (de "Beleg") (en "Reference")))
      (string txt    (width 25) (name "Text")))
  (joined
      (string accnam (width 25) (name (de "Konto") (en "Account"))))
  (foreign (acc acc.id)
           (con acc.id)))
