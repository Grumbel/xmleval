;; xmleval - A toy XML scripting language
;; Copyright (C) 2020 Ingo Ruhnke <grumbel@gmail.com>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(set! %load-path
  (cons* "/ipfs/QmcQaosGtaQ6dsb4iykNihZ2ZTie8om2i7pgHucZ9Ranyq/guix-cocfree_0.0.0-64-gd618440"
         %load-path))

(use-modules (guix build-system cmake)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (gnu packages guile)
             (gnu packages gl)
             (gnu packages pkg-config)
             (gnu packages swig)
             (guix-cocfree utils))

(define %source-dir (dirname (current-filename)))

(define clanlib-1.0
  (package-from-file
   "/ipfs/QmWeNxGLkdFQjH1XaYbz7D4zMbBDCnuwrNNuWcQgcqY2RK/clanlib-1.0_1.0.0-22-gc2f3e1c/guix.scm"))

(define-public xmleval
  (package
   (name "xmleval")
   (version (version-from-source %source-dir))
   (source (source-from-source %source-dir))
   (build-system cmake-build-system)
   (arguments
    `(#:tests? #f))  ; no tests
   (native-inputs
    `(("pkg-config" ,pkg-config)))
   (inputs
    `(("clanlib-1.0" ,clanlib-1.0)))
   (synopsis (synopsis-from-source %source-dir))
   (description (description-from-source %source-dir))
   (home-page (homepage-from-source %source-dir))
   (license license:gpl3+)))

xmleval

;; EOF ;;
