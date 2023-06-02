CLASS y228_cl_mustache DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    TYPES: BEGIN OF ty_stu,
             stu_name TYPE char10,
             sec      TYPE char2,
           END OF ty_stu,
           ty_stu_tt TYPE STANDARD TABLE OF ty_stu WITH DEFAULT KEY,
           BEGIN OF ty_dep,
             dep_name TYPE char5,
             stu      TYPE ty_stu_tt,
           END OF ty_dep.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS y228_cl_mustache IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lo_mustache TYPE REF TO zcl_mustache.
    DATA lt_data TYPE STANDARD TABLE OF ty_dep WITH DEFAULT KEY.
    DATA lr_data TYPE REF TO ty_dep.
    APPEND INITIAL LINE TO lt_data REFERENCE INTO lr_data.
    lr_data->dep_name = 'ECE'.
    lr_data->stu = VALUE ty_stu_tt( ( stu_name = 'Ojeswini' sec = 'C')
                                    ( stu_name = 'Bindu' sec = 'A' )
                                    ( stu_name = 'Mallika' sec = 'C' ) ).
    APPEND INITIAL LINE TO lt_data REFERENCE INTO lr_data.
    lr_data->dep_name = 'CSE'.
    lr_data->stu = VALUE ty_stu_tt( ( stu_name = 'Puneeth' sec = 'C')
                                    ( stu_name = 'Pavan' sec = 'A' )
                                    ( stu_name = 'Pranav' sec = 'B' ) ).
    lo_mustache = zcl_mustache=>create(
    'Welcome to {{dep_name}}'  && cl_abap_char_utilities=>newline &&
    '{{#stu}}'                 && cl_abap_char_utilities=>newline &&
    '* {{stu_name}} - {{sec}}' && cl_abap_char_utilities=>newline &&
    '{{/stu}}' ).
    out->write( lo_mustache->render( lt_data ) ).
  ENDMETHOD.
ENDCLASS.
