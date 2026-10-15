Class {
	#name : 'MyMove',
	#superclass : 'Object',
	#instVars : [
		'piece',
		'square'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'instance creation' }
MyMove class >> piece: aPiece to: aSquare [

	^ self new setPiece: aPiece square: aSquare
]

{ #category : 'testing' }
MyMove >> isCapture [
	"The move takes a piece"

	^ square hasPiece
]

{ #category : 'accessing' }
MyMove >> piece [

	^ piece
]

{ #category : 'playing' }
MyMove >> playIn: aGame [
	"Play the receiver in aGame"

	aGame move: piece to: square
]

{ #category : 'initialization' }
MyMove >> setPiece: aPiece square: aSquare [

	piece := aPiece.
	square := aSquare
]

{ #category : 'accessing' }
MyMove >> square [

	^ square
]
