(define (simple-make-seamless filename)
  (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
         (drawable (car (gimp-image-get-active-layer image))))
    (plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
    (set! drawable (car (gimp-image-get-active-layer image)))
    (gimp-file-save RUN-NONINTERACTIVE image drawable filename filename)
    (gimp-image-delete image)))

