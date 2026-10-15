Class {
	#name : 'MyChessSquare',
	#superclass : 'BlElement',
	#instVars : [
		'color',
		'name',
		'label',
		'piece',
		'contents',
		'board',
		'target'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'api - text weight' }
MyChessSquare class >> black [

	^ self color: ColorBlack default
]

{ #category : 'api - text weight' }
MyChessSquare class >> color: aColor [

	^ self basicNew
		  color: aColor;
		  initialize;
		  yourself
]

{ #category : 'api - text weight' }
MyChessSquare class >> white [

	^ self color: ColorWhite default
]

{ #category : 'arithmetic' }
MyChessSquare >> + aPoint [

	| column file |
	column := (self column asciiValue + aPoint x) asCharacter asString.
	file := (self file asciiValue + aPoint y) asCharacter asString.

	^ board at: column , file ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
MyChessSquare >> board [
	^ board
]

{ #category : 'accessing' }
MyChessSquare >> board: aMyChessBoard [ 
	
	board := aMyChessBoard
]

{ #category : 'initialization' }
MyChessSquare >> click [

	board click: self
]

{ #category : 'accessing' }
MyChessSquare >> color [

	^ color
]

{ #category : 'accessing' }
MyChessSquare >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
MyChessSquare >> column [
	
	^ name first
]

{ #category : 'accessing' }
MyChessSquare >> contents [
	^ contents
]

{ #category : 'accessing' }
MyChessSquare >> contents: aPiece [

	| text |
	contents := aPiece.

	text := contents renderPieceOn: self.
	piece text: (text asRopedText
			 fontSize: 48;
			 foreground: self foreground;
			 fontName: MyOpenChessDownloadedFont new familyName)
]

{ #category : 'asd' }
MyChessSquare >> emptyContents [
	"Remove the piece from the receiver"

	self contents: MyNoPiece new
]

{ #category : 'rendering' }
MyChessSquare >> emptyLetter [
	"The letter drawing the receiver when it is empty"

	^ color emptyLetter
]

{ #category : 'accessing' }
MyChessSquare >> file [
	
	^ name second
]

{ #category : 'accessing' }
MyChessSquare >> foreground [
			
	^ color isBlack
		ifTrue: [ board blackColor ]
		ifFalse: [ board whiteColor ]
]

{ #category : 'testing' }
MyChessSquare >> hasPiece [
	"Ask the content whether it is a real piece"

	^ contents isPiece
]

{ #category : 'highlighting' }
MyChessSquare >> highlightTarget [

	self addChild: target
]

{ #category : 'initialization' }
MyChessSquare >> initialize [

	super initialize.
	target := BlElement new
		  geometry: BlCircleGeometry new;
		  background: (Color gray alpha: 0.3).

	self layout: BlFrameLayout new.

	label := BlTextElement new.
	label constraintsDo: [ :c | c padding: (BlInsets all: 3) ].

	piece := BlTextElement new.
	piece text: '' asRopedText.
	piece constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	self
		addChild: label;
		addChild: piece.
	self
		background: Color white;
		geometry: BlSquareGeometry new.

	self addEventHandlerOn: BlClickEvent do: [ :e | self click ].
	contents := MyNoPiece new
]

{ #category : 'accessing' }
MyChessSquare >> name [
	^ name
]

{ #category : 'accessing' }
MyChessSquare >> name: aString [

	name := aString.
	label text: (name asRopedText foreground: color negated)
]

{ #category : 'accessing' }
MyChessSquare >> nameAt: anOffset [
	"The name of the square at anOffset from the receiver, even outside the board"

	^ (self column asciiValue + anOffset x) asCharacter asString
	  , (self file asciiValue + anOffset y) asCharacter asString
]

{ #category : 'printing' }
MyChessSquare >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' name: ';
		print: name
]

{ #category : 'rendering' }
MyChessSquare >> renderLetter: aLetter [
	"The letter as written on this square"

	^ color write: aLetter
]

{ #category : 'initialization' }
MyChessSquare >> select [
	
	self border: Color green
]

{ #category : 'accessing' }
MyChessSquare >> squaresAt: anOffset [
	"The square at anOffset from the receiver, or nothing when it is outside the board"

	^ board squaresNamed: (self nameAt: anOffset)
]

{ #category : 'highlighting' }
MyChessSquare >> unhighlightTarget [

	self removeChild: target
]

{ #category : 'initialization' }
MyChessSquare >> unselect [

	self border: BlBorder empty
]
