"
I am a pawn.

I move forward, one square at a time, or two squares on my first move.
I never jump over a piece and never capture straight ahead.

My forward direction is given when I am created, up the board for a white pawn, down for a black pawn.
"
Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'forwardDirection'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPawn class >> black [
	"A black pawn moves down the board"

	^ super black
		  forwardDirection: 0 @ -1;
		  yourself
]

{ #category : 'constants' }
MyPawn class >> white [
	"A white pawn moves up the board"

	^ super white
		  forwardDirection: 0 @ 1;
		  yourself
]

{ #category : 'moves' }
MyPawn >> canCaptureEnPassantOn: aSquare [
	"An opponent pawn has just jumped over aSquare"

	^ self board enPassant allowsCaptureOn: aSquare by: self
]

{ #category : 'moves' }
MyPawn >> canCaptureOn: aSquare [
	"The pawn can capture on aSquare: normally or en passant"

	^ (self hasOpponentOn: aSquare) or: [ self canCaptureEnPassantOn: aSquare ]
]

{ #category : 'moves' }
MyPawn >> canDoubleStep [
	"Only on the first move, and only if both squares ahead are free"

	^ self isOnStartingRank and: [ self isPathFree ]
]

{ #category : 'moves' }
MyPawn >> captureSquares [
	"The diagonal squares where the pawn can capture"

	^ self diagonalSquares select: [ :each | self canCaptureOn: each ]
]

{ #category : 'moves' }
MyPawn >> diagonalSquares [
	"The two squares diagonally in front of the pawn"

	^ { self leftDiagonalSquare. self rightDiagonalSquare }
]

{ #category : 'accessing' }
MyPawn >> forwardDirection [
	"The direction this pawn moves: up the board for white, down for black"

	^ forwardDirection
]

{ #category : 'accessing' }
MyPawn >> forwardDirection: aPoint [

	forwardDirection := aPoint
]

{ #category : 'moves' }
MyPawn >> forwardSquares [
	"The squares straight ahead where the pawn can go"

	^ self oneStepAdvance , self twoStepAdvance
]

{ #category : 'moves' }
MyPawn >> hasOpponentOn: aSquare [
	"There is an opponent piece on aSquare"

	^ aSquare notNil and: [
		  aSquare hasPiece and: [ self isOpponentOf: aSquare contents ] ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'moves' }
MyPawn >> isFree: aSquare [
	"A pawn only advances onto an existing, empty square: it never captures forward"

	^ aSquare notNil and: [ aSquare hasPiece not ]
]

{ #category : 'testing' }
MyPawn >> isOnLastRank [
	"There is no square in front of the pawn: it reached the end of the board"

	^ self oneSquareAhead isNil
]

{ #category : 'testing' }
MyPawn >> isOnStartingRank [
	"A pawn never moves backward, so it is on its starting rank
	when the square two steps behind it is outside the board."

	^ (square + (forwardDirection * -2)) isNil
]

{ #category : 'moves' }
MyPawn >> isPathFree [
	"Both squares ahead are free, the pawn never jumps over a piece"

	^ (self isFree: self oneSquareAhead) and: [ self isFree: self twoSquaresAhead ]
]

{ #category : 'moves' }
MyPawn >> leftDiagonalSquare [
	"The square diagonally in front of the pawn, on its left"

	^ square + (forwardDirection + (-1 @ 0))
]

{ #category : 'promotion' }
MyPawn >> moveTo: aSquare promotingTo: aPieceClass [
	"Move to aSquare, then become a piece of aPieceClass if the pawn reached the last rank"

	self moveTo: aSquare.
	self promoteTo: aPieceClass
]

{ #category : 'promotion' }
MyPawn >> newPieceOf: aPieceClass [
	"A new piece of aPieceClass, with the color of the pawn"

	^ aPieceClass new
		  color: color;
		  yourself
]

{ #category : 'moves' }
MyPawn >> oneSquareAhead [
	"The square right in front of the pawn"

	^ square + forwardDirection
]

{ #category : 'moves' }
MyPawn >> oneStepAdvance [
	"The square right ahead, if it is free"

	^ { self oneSquareAhead } select: [ :each | self isFree: each ]
]

{ #category : 'moving' }
MyPawn >> performMoveTo: aSquare [
	"The pawn removes the pawn it captures en passant, moves like any piece
	and leaves an en passant capture behind it"

	| enPassant |
	self board enPassant removeCapturedPawnFor: self on: aSquare.
	enPassant := MyEnPassant pawn: self skipping: self oneSquareAhead.
	super performMoveTo: aSquare.
	self board enPassant: enPassant
]

{ #category : 'promotion' }
MyPawn >> promoteTo: aPieceClass [
	"On the last rank, the pawn is replaced by a new piece of aPieceClass"

	self promotionSquares do: [ :each |
		self board at: each name put: (self newPieceOf: aPieceClass) ]
]

{ #category : 'promotion' }
MyPawn >> promotionSquares [
	"The square of the pawn if it reached the last rank, otherwise nothing"

	^ { square } select: [ :each | self isOnLastRank ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'moves' }
MyPawn >> rightDiagonalSquare [
	"The square diagonally in front of the pawn, on its right"

	^ square + (forwardDirection + (1 @ 0))
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	"The squares the pawn can reach by advancing or by capturing"

	^ self forwardSquares , self captureSquares
]

{ #category : 'moves' }
MyPawn >> twoSquaresAhead [
	"The square two steps in front of the pawn"

	^ square + (forwardDirection * 2)
]

{ #category : 'moves' }
MyPawn >> twoStepAdvance [
	"The square two steps ahead, if the pawn can make its double step"

	^ { self twoSquaresAhead } select: [ :each | self canDoubleStep ]
]
