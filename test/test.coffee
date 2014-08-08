###
Dependencies
###
Antispam = require '../'
should   = require 'should'

###
Test
###
describe 'Antispam :: ', ->

  it 'return the same word if doesnt contains a valid email', ->
    Antispam.parser('hola').should.eql('hola')

  it 'return the same word if the string is AT', ->
    Antispam.parser('AT').should.eql('AT')

  it 'AT between two words is not a valid email',  ->
    Antispam.parser('holaAThola').should.eql('holaAThola')

  it 'replace AT in a valid email', ->
    Antispam.parser('holaAThotmail.com').should.eql('hola@hotmail.com')

  it 'replace DOT in a valid email', ->
    Antispam.parser('holaAThotmailDOTcom').should.eql('hola@hotmail.com')

  it 'doesnt replace if DOT is before the AT', ->
    Antispam.parser('holaDOThotmailATcom').should.eql('holaDOThotmailATcom')
    Antispam.parser('holaDOTcom').should.eql('holaDOTcom')
    Antispam.parser('ATholaDOTcom').should.eql('ATholaDOTcom')

  it 'translate the mail in a prhrase', ->
    Antispam.parser('email emailATdomainDOTcom').should.eql('email email@domain.com')

  it 'two string when the first contain AT and the second string content a DOT',  ->
    Antispam.parser('holaAThola holaDOThola').should.eql('holaAThola holaDOThola')
