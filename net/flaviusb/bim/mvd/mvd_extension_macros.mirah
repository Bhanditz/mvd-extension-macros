import mirah.lang.ast.*

import org.mirah.macros.anno.ExtensionsRegistration

package net.flaviusb.bim.mvd

$ExtensionsRegistration[['[]', 'java.util.Collection']]
class IfcCollectionOps
  macro def only_type(&block)
    zog = gensym
    quote {
      (`@call.target`.select {|foo| foo.kind_of?(`block.arguments.required(0).type`)}).each do |`block.arguments`|
        #`block.arguments.required(0).identifier` = `block.arguments.required(0).type`(`zog`)
        `block.body`
      end
    }
  end
end
