#[derive(Copy, Drop)]
struct AssetStorageData {
    asset_value: u256,
    total_value: u256,
    project_value: u256,
    slot: u256,
}

#[derive(Copy, Drop)]
struct SlotData {
    total_value: u256,
    project_value: u256,
    slot: u256,
    status: ProjectStatus,
}

#[derive(Copy, Drop)]
enum ProjectStatus {
    Active,
    Inactive,
    Closed,
}
