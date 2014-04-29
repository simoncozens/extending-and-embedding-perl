<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY % print "INCLUDE">
<![%print;[
<!ENTITY docbook.dsl SYSTEM
"/usr/lib/sgml/stylesheet/dsssl/docbook/cygnus/cygnus-both.dsl" CDATA dsssl>
]]>
]>

<style-sheet>
<style-specification id="print" use="docbook">
<style-specification-body> 
(define %body-font-family% "gar")
</style-specification-body>
</style-specification>

<external-specification id="docbook" document="docbook.dsl">
</style-sheet>
