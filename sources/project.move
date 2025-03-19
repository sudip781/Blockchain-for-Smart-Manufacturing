module MyModule::SmartManufacturing {

    use aptos_framework::signer;

    /// Struct representing a manufacturing machine.
    struct Machine has store, key {
        efficiency: u64, // Efficiency score of the machine
    }

    /// Function to initialize a new machine with an efficiency value.
    public fun initialize_machine(owner: &signer, efficiency: u64) {
        let machine = Machine { efficiency };
        move_to(owner, machine);
    }

    /// Function to update the efficiency of a registered machine.
    public fun update_efficiency(owner: &signer, new_efficiency: u64) acquires Machine {
        let machine = borrow_global_mut<Machine>(signer::address_of(owner));
        machine.efficiency = new_efficiency;
    }
}
