# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fi = FinancialInstitution.create(
  name: 'Capital One 360',
  fid:  '031176110',
  org:  'ING DIRECT',
  url:  'https://ofx.capitalone360.com/OFX/ofx.html',
  sync_class:   'SyncCapitalOne360',
  ofx_template: <<-HTML
OFXHEADER:100
DATA:OFXSGML
VERSION=103
SECURITY=NONE
ENCODING=USASCII
CHARSET:1252
COMPRESSION:NONE
OLDFILEUID=NONE
NEWFILEUID=NONE

<OFX>
  <SIGNONMSGSRQV1>
    <SONRQ>
      <DTCLIENT>{{dtclient}}
      <USERID>{{userid}}
      <USERPASS>{{userpass}}
      <LANGUAGE>ENG
      <APPID>PFIN
      <APPVER>0001
    </SONRQ>
  </SIGNONMSGSRQV1>
  <BANKMSGSRQV1>
    <STMTTRNRQ>
      <TRNUID>{{trnuid}}
      <STMTRQ>
        <BANKACCTFROM>
          <BANKID>{{bankid}}
          <ACCTID>{{acctid}}
          <ACCTTYPE>{{accttype}}
        </BANKACCTFROM>
        <INCTRAN>
          <DTSTART>{{dtstart}}
          <DTEND>{{dtend}}
          <INCLUDE>Y
        </INCTRAN>
      </STMTRQ>
    </STMTTRNRQ>
  </BANKMSGSRQV1>
</OFX>
HTML
)