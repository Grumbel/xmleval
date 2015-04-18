xmleval
=======

A toy scripting language based on XML syntax.


Usage
-----

    $ build/xmleval scripts/prim.xml
    3 is prime
    5 is prime
    7 is prime
    11 is prime
    13 is prime
    17 is prime
    19 is prime
    23 is prime
    29 is prime
    31 is prime
    37 is prime
    41 is prime
    43 is prime
    47 is prime
    ...

    $ cat scripts/prim.xml
    <?xml version="1.0" encoding="UTF-8"?>
    <block>
      <function name="checkprim">
        <set name="prim" var="1"/>

        <set name="end" var="i" />
        <add name="end" var="-1" />

        <for name="j" start="2" end="end">
          <set    name="test" var="i" />
          <modulo name="test" var="j" />

          <if-zero var="test">
            <set name="prim" var="0"/>
            <set name="j" var="end"/><!-- break -->
          </if-zero>
        </for>

        <if-non-zero var="prim">
          <printvar var="i" />
          <print string=" is prime" />
          <newline />
        </if-zero>
      </function>

      <for name="i" start="3" end="150">
        <funcall name="checkprim" />
      </for>
    </block>
