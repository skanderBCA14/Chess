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
MyPawn >> canDoubleStep [
	"Only on the first move, and only if both squares ahead are free"

	^ self isOnStartingRank and: [ self isPathFree ]
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
MyPawn >> oneSquareAhead [
	"The square right in front of the pawn"

	^ square + forwardDirection
]

{ #category : 'moves' }
MyPawn >> oneStepAdvance [
	"The square right ahead, if it is free"

	^ { self oneSquareAhead } select: [ :each | self isFree: each ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
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
