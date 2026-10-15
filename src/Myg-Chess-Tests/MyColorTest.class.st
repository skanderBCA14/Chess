"
I check how the white and black colors draw pieces and squares.
"
Class {
	#name : 'MyColorTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyColorTest >> testBlackEmptyLetter [

	self assert: ColorBlack default emptyLetter equals: 'x'
]

{ #category : 'tests' }
MyColorTest >> testBlackGivesTheBlackLetterOfAPiece [

	self assert: (ColorBlack default letterOf: MyKnight new) equals: 'M'
]

{ #category : 'tests' }
MyColorTest >> testBlackWritesTheLetterInLowercase [

	self assert: (ColorBlack default write: 'N') equals: 'n'
]

{ #category : 'tests' }
MyColorTest >> testWhiteEmptyLetter [

	self assert: ColorWhite default emptyLetter equals: 'z'
]

{ #category : 'tests' }
MyColorTest >> testWhiteGivesTheWhiteLetterOfAPiece [

	self assert: (ColorWhite default letterOf: MyKnight new) equals: 'N'
]

{ #category : 'tests' }
MyColorTest >> testWhiteKeepsTheLetter [

	self assert: (ColorWhite default write: 'N') equals: 'N'
]
