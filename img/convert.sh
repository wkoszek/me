#!/bin/sh

for FILE in IMG_*; do
	convert \
		-resize 20% \
		-type Grayscale \
		 -level 0%,100%,1.5 \
		${FILE} small_${FILE}
done
