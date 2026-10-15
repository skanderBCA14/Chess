Class {
	#name : 'MyPiece',
	#superclass : 'Object',
	#instVars : [
		'color',
		'square'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPiece class >> black [

	^ self new
		  color: Color black;
		  yourself
]

{ #category : 'constants' }
MyPiece class >> white [

	^ self new
		  color: Color white;
		  yourself
]

{ #category : 'as yet unclassified' }
MyPiece >> attackingSquares [

	^ self legalTargetSquares
]

{ #category : 'rendering' }
MyPiece >> blackLetter [
	"The letter drawing a black piece of this kind in the chess font"

	^ self subclassResponsibility
]

{ #category : 'path commands' }
MyPiece >> board [

	^ square board
]

{ #category : 'rendering' }
MyPiece >> collectSquaresToward: aDirection legal: shouldBeLegal [
	"The squares reached by sliding toward aDirection, only inside the board"

	| targets next |
	targets := OrderedCollection new.
	next := square squaresAt: aDirection.
	[ next anySatisfy: [ :each | shouldBeLegal ==> each hasPiece not ] ]
		whileTrue: [
			targets addAll: next.
			next := next flatCollect: [ :each | each squaresAt: aDirection ] ].
	targets addAll: (next select: [ :each | self isOpponentOf: each contents ]).
	^ targets
]

{ #category : 'accessing' }
MyPiece >> color [

	^ color
]

{ #category : 'accessing' }
MyPiece >> color: aColor [

	color := aColor
]

{ #category : 'directions' }
MyPiece >> diagonalDirections [
	"The four diagonals"

	^ { 1 @ 1. -1 @ 1. 1 @ -1. -1 @ -1 }
]

{ #category : 'accessing' }
MyPiece >> id [

	^ 'Q'
]

{ #category : 'testing' }
MyPiece >> isKing [
	
	^ false
]

{ #category : 'testing' }
MyPiece >> isOpponentOf: aPiece [
	"aPiece belongs to the other player"

	^ aPiece color ~= color
]

{ #category : 'testing' }
MyPiece >> isPiece [
	
	^ true
]

{ #category : 'testing' }
MyPiece >> isWhite [
	
	^ color isBlack not
]

{ #category : 'path commands' }
MyPiece >> legalTargetSquares [

	^ self targetSquaresLegal: true
]

{ #category : 'rendering' }
MyPiece >> letter [
	"The letter drawing the receiver, chosen by its color"

	^ self letters at: color
]

{ #category : 'rendering' }
MyPiece >> letters [
	"The letter of this kind of piece for each color"

	^ {
		  (Color white -> self whiteLetter).
		  (Color black -> self blackLetter) } asDictionary
]

{ #category : 'directions' }
MyPiece >> lineDirections [
	"Up, down, left and right"

	^ { 0 @ 1. 0 @ -1. -1 @ 0. 1 @ 0 }
]

{ #category : 'moving' }
MyPiece >> moveIn: aGame to: aSquare [
	"Ask aGame to move the receiver to aSquare"

	aGame move: self to: aSquare
]

{ #category : 'moving' }
MyPiece >> moveTo: aSquare [
	"Move to aSquare if the move is allowed"

	(self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].
	self performMoveTo: aSquare
]

{ #category : 'moving' }
MyPiece >> performMoveTo: aSquare [
	"Move to aSquare. Any move ends the possible en passant capture."

	self board resetEnPassant.
	self placeOn: aSquare
]

{ #category : 'moving' }
MyPiece >> placeOn: aSquare [
	"Leave the current square and stand on aSquare, replacing the piece that was there"

	square emptyContents.
	square := aSquare.
	aSquare contents: self
]

{ #category : 'rendering' }
MyPiece >> renderPieceOn: aSquare [
	"The receiver as written on aSquare"

	^ aSquare renderLetter: self letter
]

{ #category : 'accessing' }
MyPiece >> square [
	^ square
]

{ #category : 'accessing' }
MyPiece >> square: aMyChessSquare [ 
	
	square := aMyChessSquare
]

{ #category : 'rendering' }
MyPiece >> targetSquares [

	^ self targetSquaresLegal: false
]

{ #category : 'rendering' }
MyPiece >> targetSquaresLegal: aBoolean [

	self subclassResponsibility
]

{ #category : 'rendering' }
MyPiece >> whiteLetter [
	"The letter drawing a white piece of this kind in the chess font"

	^ self subclassResponsibility
]
