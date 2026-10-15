Class {
	#name : 'MyKnight',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyKnight >> blackLetter [
	"A black knight is drawn with M"

	^ 'M'
]

{ #category : 'accessing' }
MyKnight >> id [
	
	^ 'N'
]

{ #category : 'rendering' }
MyKnight >> jumpSquares [
	"The squares the knight can jump to, only inside the board"

	^ self jumps flatCollect: [ :each | square squaresAt: each ]
]

{ #category : 'rendering' }
MyKnight >> jumps [
	"The offsets of a knight move: two squares in one direction and one in the other"

	^ { 1 @ 2. 2 @ 1. 2 @ -1. 1 @ -2. -1 @ -2. -2 @ -1. -2 @ 1. -1 @ 2 }
]

{ #category : 'rendering' }
MyKnight >> targetSquaresLegal: aBoolean [
	"The squares the knight can jump to, empty or held by an opponent"

	^ self jumpSquares select: [ :each |
		  each hasPiece not or: [ self isOpponentOf: each contents ] ]
]

{ #category : 'rendering' }
MyKnight >> whiteLetter [
	"A white knight is drawn with N"

	^ 'N'
]
