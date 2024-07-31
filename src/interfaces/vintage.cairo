use metadata::metadata::vintages::models::CarbonVintage;

#[starknet::interface]
trait IVintage<TContractState> {
    /// Returns the vintage start and end years.
    fn get_vintage_range(self: @TContractState) -> (u32, u32);
    
    /// Returns the project total carbon credits.
    fn get_project_carbon(self: @TContractState) -> u128;

    ///  Convert a share of supply balance to a carbon credit balance.
    fn share_to_cc(self: @TContractState, share: u256, token_id: u256) -> u256;

    /// Convert a carbon credit balance to a share of supply balance.
    fn cc_to_share(self: @TContractState, cc_value: u256, token_id: u256) -> u256;

    /// Returns the number of vintages of the project.
    fn get_num_vintages(self: @TContractState) -> usize;

    /// Returns all available vintage details.
    fn get_cc_vintages(self: @TContractState) -> Span<CarbonVintage>;

    /// Returns the vintage details with the given token_id.
    fn get_carbon_vintage(self: @TContractState, token_id: u256) -> CarbonVintage;

    /// Get number of decimal for total supply to have a carbon credit
    fn get_cc_decimals(self: @TContractState) -> u8;

    /// Update the vintage status
    fn update_vintage_status(ref self: TContractState, token_id: u256, status: u8);

    /// Adapt the cc_supply of a vintage, will impact holders balance.
    fn rebase_vintage(ref self: TContractState, token_id: u256, new_cc_supply: u128);

    /// Set the project total carbon credits. TODO: check if needed
    fn set_project_carbon(ref self: TContractState, new_carbon: u128);

    /// Set all carbon vintages based on absorption curve
    fn set_vintages(ref self: TContractState, yearly_absorptions: Span<u128>, start_year: u32);
}
