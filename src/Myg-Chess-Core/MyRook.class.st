Class {
	#name : 'MyRook',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyRook >> blackLetter [
	"A black rook is drawn with T"

	^ 'T'
]

{ #category : 'accessing' }
MyRook >> id [
	^ 'R'
]

{ #category : 'rendering' }
MyRook >> targetSquares [

	^ self upFile , self downFile , self leftFile , self rightFile
]

{ #category : 'rendering' }
MyRook >> targetSquaresLegal: aBoolean [
	"The rook slides along the lines"

	^ self lineDirections flatCollect: [ :each |
		  self collectSquaresToward: each legal: aBoolean ]
]

{ #category : 'rendering' }
MyRook >> whiteLetter [
	"A white rook is drawn with R"

	^ 'R'
]
