CLASS y228_cl_helloworld DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA : lv_msg TYPE string.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS y228_cl_helloworld IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write('HEllo WORLD!').
  ENDMETHOD.
ENDCLASS.
