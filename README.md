# L10n-o3db-contabi
Romanian localization for o3db-contabi o3db.com

http://o3db.com/app/contabi.html
usage:
    enter enter to submit password
    escape cursor enter to select pull down menu

now look at the source, first the HTML source itself

next: http://o3db.com/app/contabi-schema.scm and http://o3db.com/app/contabi-forms.scm

thats my own R4RS Scheme running inside browser

(apply set-meta! (read-forms "http://o3db.com/app/contabi-schema.scm")) <- the schema and forms are a kind of DSL loaded at this place from the HTML source

http://o3db.com/doc/install.html <- should contain most actual source

    (set-language! 'ro "Romanian" "http://o3db.com/style/RO.png")

to show the 3rd flag

comments: #;( till )
