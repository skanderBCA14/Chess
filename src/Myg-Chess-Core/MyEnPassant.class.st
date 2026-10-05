"
I represent a possible en passant capture.

A pawn just moved two squares: I know this pawn and the square it jumped over.
An opponent pawn can capture it by moving onto that square.
"
Class {
	#name : 'MyEnPassant',
	#superclass : 'Object',
	#instVars : [
		'pawn',
		'skippedSquare'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyEnPassant class >> pawn: aPawn skipping: aSquare [
	"aPawn just moved two squares, jumping over aSquare"

	^ self new
		  setPawn: aPawn skipping: aSquare;
		  yourself
]

{ #category : 'testing' }
MyEnPassant >> allowsCaptureOn: aSquare by: aPawn [
	"aPawn can capture en passant by moving onto aSquare"

	^ aSquare = skippedSquare and: [ aPawn isOpponentOf: pawn ]
]

{ #category : 'initialization' }
MyEnPassant >> setPawn: aPawn skipping: aSquare [

	pawn := aPawn.
	skippedSquare := aSquare
]
