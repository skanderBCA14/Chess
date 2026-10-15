"
The white color. It knows how white pieces and light squares are drawn.
"
Class {
	#name : 'ColorWhite',
	#superclass : 'Color',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
ColorWhite class >> default [
	"The white color of the chess game"

	^ self r: 1 g: 1 b: 1
]

{ #category : 'rendering' }
ColorWhite >> emptyLetter [
	"An empty light square is drawn with z"

	^ 'z'
]

{ #category : 'rendering' }
ColorWhite >> letterOf: aPiece [
	"A white piece is drawn with its white letter"

	^ aPiece whiteLetter
]

{ #category : 'rendering' }
ColorWhite >> write: aLetter [
	"A letter is written as it is on a light square"

	^ aLetter
]
