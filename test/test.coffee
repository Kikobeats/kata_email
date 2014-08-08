###
Dependencies
###
MailNormalizer = require '../'
should         = require 'should'

###
Test
###
describe 'MailNormalizer :: ', ->

  before  ->
    @mail = new MailNormalizer()

  describe 'helpers', ->

    it 'count number of character in a string',  ->
      @mail._countNumberOfCharacter('hola.que.tal', '.').should.eql(2)

    it 'replace all ocurrences of a character',  ->
      @mail._replaceAll('holaDOTqueDOTtal', 'DOT', '.').should.eql('hola.que.tal')

  describe 'parse', ->

    it 'when the same word if doesnt contains a valid email', ->
      @mail.parse('hola').should.eql('hola')

    it 'when the same word if the string is AT', ->
      @mail.parse('AT').should.eql('AT')

    it 'when the same word if the string is DOT', ->
      @mail.parse('DOT').should.eql('DOT')

    it 'when AT between two words is not a valid email',  ->
      @mail.parse('holaAThola').should.eql('holaAThola')

    it 'when AT in a valid email', ->
      @mail.parse('holaAThotmail.com').should.eql('hola@hotmail.com')

    it 'when DOT is before the AT', ->
      @mail.parse('holaDOTcom').should.eql('holaDOTcom')
      @mail.parse('ATholaDOTcom').should.eql('ATholaDOTcom')

    it 'when the mail in a prhrase', ->
      @mail.parse('email emailATdomainDOTcom').should.eql('email email@domain.com')

    it 'when two string when the first contain AT and the second string content a DOT',  ->
      @mail.parse('holaAThola holaDOThola').should.eql('holaAThola holaDOThola')

    it 'when three different strings and the last one is an email',  ->
      @mail.parse('holaAT something holaATholaDOTcom').should.eql('holaAT something hola@hola.com')

    it 'when replace when email have a point in the address',  ->
      @mail.parse('holaAThotmailDOTcom').should.eql('hola@hotmail.com')
      @mail.parse('holaDOTkikoATdomainDOTcom').should.eql('hola.kiko@domain.com')

    it 'when replace when email use a more than one point in the address',  ->
      @mail.parse('holaDOTkikoATdomainDOTcom').should.eql('hola.kiko@domain.com')
      @mail.parse('hol@DOTkikoATdomainDOTcom').should.eql('hol@.kiko@domain.com')
