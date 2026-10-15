Class {
	#name : 'MyBishop',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyBishop >> blackLetter [
	"A black bishop is drawn with V"

	^ 'V'
]

{ #category : 'accessing' }
MyBishop >> id [
	
	^ 'B'
]

{ #category : 'rendering' }
MyBishop >> targetSquaresLegal: aBoolean [
	"The bishop slides along the diagonals"

	^ self diagonalDirections flatCollect: [ :each |
		  self collectSquaresToward: each legal: aBoolean ]
]

{ #category : 'rendering' }
MyBishop >> whiteLetter [
	"A white bishop is drawn with B"

	^ 'B'
]
