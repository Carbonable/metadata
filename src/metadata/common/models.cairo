#[derive(Copy, Drop)]
struct StorageData {
    asset_value: u256,
    total_value: u256,
    project_value: u256,
    slot: u256,
}

#[derive(Copy, Drop)]
struct TokenData {
    slot_data: SlotData,
    asset_value: u256,
    description: Span<felt252>,
    token_id: u256,
}

#[derive(Copy, Drop)]
struct SlotData {
    project_data: ProjectData,
    total_value: u256,
    project_value: u256,
    slot: u256,
    status: ProjectStatus,
    description: Span<felt252>,
}

#[derive(Copy, Drop)]
enum ProjectStatus {
    Upcoming,
    Live,
    Paused,
    Stopped,
    Ended
}

type String = Span<felt252>;

#[derive(Copy, Drop)]
struct ProjectData {
    name: String,
    developer: String,
    certifier: String,
    area: u256,
    country: String,
    end_year: u256,
    end_month: u256,
    duration_in_years: u256,
    projected_cu: u256,
    color: String, // Color 
    type_: String, // Type
    category: String, // Category
    status: String, // Status
    source: String, // Source
    sdgs: Span<felt252>,
}
