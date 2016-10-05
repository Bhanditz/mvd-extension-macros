import org.mirah.typer.TypeSystem
import java.util.Collections
import org.mirah.macros.ExtensionsProvider
import org.mirah.macros.ExtensionsService

package net.flaviusb.bim.mvd

class RegisterMacros implements ExtensionsProvider
  def register(type_system: ExtensionsService): void
    type_system.macro_registration(IfcCollectionOps.class)
  end
end
