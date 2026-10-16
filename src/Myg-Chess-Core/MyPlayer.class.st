Class {
	#name : 'MyPlayer',
	#superclass : 'Object',
	#instVars : [
		'color',
		'game',
		'strategy'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPlayer >> black [

	self color: Color black
]

{ #category : 'accessing' }
MyPlayer >> color [

	^ color
]

{ #category : 'accessing' }
MyPlayer >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
MyPlayer >> game [

	^ game
]

{ #category : 'accessing' }
MyPlayer >> game: anObject [

	game := anObject
]

{ #category : 'initialization' }
MyPlayer >> initialize [

	super initialize.
	strategy := MyRandomStrategy new
]

{ #category : 'testing' }
MyPlayer >> isWhite [
	
	^ color = Color white
]

{ #category : 'accessing' }
MyPlayer >> king [
	
	^ self pieces detect: [ :p | p isKing ]
]

{ #category : 'playing' }
MyPlayer >> movablePieces [
	"Only the king can move when it is in check, otherwise every piece"

	^ self pieces select: [ :each | each isKing or: [ self king isInCheck not ] ]
]

{ #category : 'playing' }
MyPlayer >> movesOf: aPiece [
	"The legal moves of aPiece"

	^ aPiece legalTargetSquares collect: [ :each | MyMove piece: aPiece to: each ]
]

{ #category : 'accessing' }
MyPlayer >> pieces [
	"The pieces of the receiver's color"

	^ game pieces select: [ :each | each color = self color ]
]

{ #category : 'playing' }
MyPlayer >> play [
	"Play the move chosen by the strategy"

	| moves |
	moves := self possibleMoves.
	moves ifEmpty: [ ^ self error: 'No moves available' ].
	(strategy chooseAmong: moves) playIn: game
]

{ #category : 'playing' }
MyPlayer >> possibleMoves [
	"Every legal move of the pieces that can move"

	^ self movablePieces flatCollect: [ :each | self movesOf: each ]
]

{ #category : 'accessing' }
MyPlayer >> strategy: aStrategy [
	"Choose how the player chooses its moves"

	strategy := aStrategy
]

{ #category : 'constants' }
MyPlayer >> white [

	self color: Color white
]
