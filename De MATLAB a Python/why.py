# -*- coding: utf-8 -*-
from random import randint as rint


class Foo:
	def why(self):
		tmp = rint(1,10)
		if tmp in [1]:
			a = self.special_case()
		elif tmp in [2, 3, 4]:
			a = self.phrase()
		else:
			a = self.sentence()
		return a.capitalize()

	def special_case(self):
		sw = {	1 : 'why not?',
				2 : 'don''t ask!',
				3 : 'it''s your karma.',
				4 : 'stupid question!',
				5 : 'how should I know?',
				6 : 'can you rephrase that?',
				7 : 'it should be obvious.',
				8 : 'the devil made me do it.',
				9 : 'the computer did it.',
				10: 'the customer is always right.',
				11: 'in the beginning, God created the heavens and the earth...',
				12: 'don''t you have something better to do?'}
		return sw[rint(1,12)]

	def phrase(self):
		sw = {	1:'for the '+self.nouned_verb()+' '+self.prepositional_phrase()+'.',
				2:'to '+self.present_verb()+' '+self.object()+'.',
				3:'because '+self.sentence()}
		return sw[rint(1,3)]

	def preposition(self):
		sw = {	1:'of',
				2:'from'}
		return sw[rint(1,2)]

	def prepositional_phrase(self):
		sw = {	1:self.preposition()+' '+self.article()+' '+self.noun_phrase(),
				2:self.preposition()+' '+self.proper_noun(),
				3:self.preposition()+' '+self.accusative_pronoun()}
		return sw[rint(1,3)]

	def sentence(self):
		return self.subject()+' '+self.predicate()+'.'

	def subject(self):
		tmp = rint(1,4)
		if tmp in [1]:
			return self.proper_noun()
		elif tmp in [2]:
			return self.nominative_pronoun()
		else:
			return self.article()+' '+self.noun_phrase()

	def proper_noun(self):
		sw = {	1 : 'Cleve',
				2 : 'Jack',
				3 : 'Bill',
				4 : 'Joe',
				5 : 'Pete',
				6 : 'Loren',
				7 : 'Damian',
				8 : 'Barney',
				9 : 'Nausheen',
				10: 'Mary Ann',
				11: 'Penny',
				12: 'Mara'}
		return sw[rint(1,12)]

	def noun_phrase(self):
		tmp = rint(1,4)
		if tmp in [1]:
			return self.noun()
		elif tmp in [2]:
			return self.adjective_phrase()+' '+self.noun_phrase()
		else:
			return self.adjective_phrase()+' '+self.noun()

	def noun(self):
		sw = {	1 : 'mathematician',
				2 : 'programmer',
				3 : 'system manager',
				4 : 'engineer',
				5 : 'hamster',
				6 : 'kid'}
		return sw[rint(1,6)]

	def nominative_pronoun(self):
		sw = {	1 : 'I',
				2 : 'you',
				3 : 'he',
				4 : 'she',
				5 : 'they'}
		return sw[rint(1,5)]

	def accusative_pronoun(self):
		sw = {	1 : 'me',
				2 : 'all',
				3 : 'her',
				4 : 'him'}
		return sw[rint(1,4)]

	def nouned_verb(self):
		sw = {	1 : 'love',
				2 : 'approval'}
		return sw[rint(1,2)]

	def adjective_phrase(self):
		tmp = rint(1,6)
		if tmp in [1,2,3]:
			return self.adjective()
		elif tmp in [4,5]:
			return self.adjective_phrase()+' and '+self.adjective_phrase()
		else:
			return self.adverb()+' '+self.adjective()

	def adverb(self):
		sw = {	1 : 'very',
				2 : 'not very',
				3 : 'not excessively'}
		return sw[rint(1,3)]

	def adjective(self):
		sw = {	1 : 'tall',
				2 : 'bald',
				3 : 'young',
				4 : 'smart',
				5 : 'rich',
				6 : 'terrified',
				7 : 'good'}
		return sw[rint(1,7)]

	def article(self):
		sw = {	1 : 'the',
				2 : 'some',
				3 : 'a'}
		return sw[rint(1,3)]

	def predicate(self):
		tmp = rint(1,3)
		if tmp in [1]:
			return self.transitive_verb()+' '+self.object()
		else:
			return self.intransitive_verb()

	def present_verb(self):
		sw = {	1 : 'fool',
				2 : 'please',
				3 : 'satisfy'}
		return sw[rint(1,3)]

	def transitive_verb(self):
		tmp = rint(1,10)
		if tmp in [1]:
			return 'threatened'
		elif tmp in [2]:
			return 'told'
		elif tmp in [3]:
			return 'asked'
		elif tmp in [4]:
			return 'helped'
		else:
			return 'obeyed'

	def intransitive_verb(self):
		sw = {	1 : 'insisted on it',
				2 : 'suggested it',
				3 : 'told me to',
				4 : 'wanted it',
				5 : 'knew it was a good idea',
				6 : 'wanted it that way'}
		return sw[rint(1,6)]

	def object(self):
		tmp = rint(1,10)
		if tmp in [1]:
			return self.accusative_pronoun()
		else:
			return self.article()+' '+self.noun_phrase()


print(Foo().why())