###
Dependencies
###
MailNormalizer = require '../'
should   = require 'should'

###
Test
###
describe 'MailNormalizer :: ', ->

  before  ->
    @mail = new MailNormalizer()

  it 'return the same word if doesnt contains a valid email', ->
    @mail.parse('hola').should.eql('hola')

  it 'return the same word if the string is AT', ->
    @mail.parse('AT').should.eql('AT')

  it 'AT between two words is not a valid email',  ->
    @mail.parse('holaAThola').should.eql('holaAThola')

  it 'replace AT in a valid email', ->
    @mail.parse('holaAThotmail.com').should.eql('hola@hotmail.com')

  it 'replace DOT in a valid email', ->
    @mail.parse('holaAThotmailDOTcom').should.eql('hola@hotmail.com')

  it 'doesnt replace if DOT is before the AT', ->
    @mail.parse('holaDOThotmailATcom').should.eql('holaDOThotmailATcom')
    @mail.parse('holaDOTcom').should.eql('holaDOTcom')
    @mail.parse('ATholaDOTcom').should.eql('ATholaDOTcom')

  it 'translate the mail in a prhrase', ->
    @mail.parse('email emailATdomainDOTcom').should.eql('email email@domain.com')

  it 'two string when the first contain AT and the second string content a DOT',  ->
    @mail.parse('holaAThola holaDOThola').should.eql('holaAThola holaDOThola')

  it 'three different strings and the last one is an email',  ->
    @mail.parse('holaAT something holaATholaDOTcom').should.eql('holaAT something hola@hola.com')
