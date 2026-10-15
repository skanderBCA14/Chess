Class {
	#name : 'MyQueen',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyQueen >> blackLetter [
	"A black queen is drawn with W"

	^ 'W'
]

{ #category : 'rendering' }
MyQueen >> targetSquaresLegal: aBoolean [
	"The queen slides along the lines like a rook and along the diagonals like a bishop"

	^ (self lineDirections , self diagonalDirections) flatCollect: [ :each |
		  self collectSquaresToward: each legal: aBoolean ]
]

{ #category : 'rendering' }
MyQueen >> whiteLetter [
	"A white queen is drawn with Q"

	^ 'Q'
]
