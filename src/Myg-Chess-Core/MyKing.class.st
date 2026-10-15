Class {
	#name : 'MyKing',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyKing >> attackingSquares [

	^ self basicTargetSquares
]

{ #category : 'rendering' }
MyKing >> basicTargetSquares [
	"The squares around the king, only inside the board"

	^ self steps flatCollect: [ :each | square squaresAt: each ]
]

{ #category : 'rendering' }
MyKing >> blackLetter [
	"A black king is drawn with L"

	^ 'L'
]

{ #category : 'accessing' }
MyKing >> id [
	
	^ 'K'
]

{ #category : 'testing' }
MyKing >> isCheckMated [
	"We check if the opponent pieces target all my potential movements and myself"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ self legalTargetSquares isEmpty and: [
		  threatenedSquares includes: self square ]
]

{ #category : 'testing' }
MyKing >> isInCheck [
	"We check if the opponent pieces target all my potential movements and myself"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ threatenedSquares includes: self square
]

{ #category : 'testing' }
MyKing >> isKing [
	
	^ true
]

{ #category : 'accessing' }
MyKing >> opponentPieces [
	"The pieces of the other color"

	^ self board pieces select: [ :each | each color = color negated ]
]

{ #category : 'rendering' }
MyKing >> steps [
	"The offsets of a king move: one square in every direction"

	^ { 1 @ 0. 1 @ 1. 0 @ 1. -1 @ 1. -1 @ 0. -1 @ -1. 0 @ -1. 1 @ -1 }
]

{ #category : 'rendering' }
MyKing >> targetSquaresLegal: aBoolean [
	"The king cannot move to threatened squares"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :each |
		                     each attackingSquares ].

	^ self basicTargetSquares select: [ :s |
		  (threatenedSquares includes: s) not and: [
			  s hasPiece not or: [
				  "The square has an opponent piece"
				  s contents color ~= color and: [
					  "Let's hope the piece is not defended"
					  threatenedSquares includes: s ] ] ] ]
]

{ #category : 'rendering' }
MyKing >> whiteLetter [
	"A white king is drawn with K"

	^ 'K'
]
