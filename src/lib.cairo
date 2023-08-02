mod interfaces {
    mod erc3525;
    mod project;
    mod slot_metadata;
    mod contract_metadata;
    mod erc165;
    mod component;
}

mod components {
    mod component {
        mod carbonable_logo;
    }
    mod library;
}

mod metadata {
    mod common {
        mod constants;
        mod models;
    }
    mod project {
        mod contract;
        mod data;
        mod library;
    }
    mod slots {
        mod banegasfarm {
            mod contract;
            mod data;
        }
        mod template {
            mod slot;
            mod token;
        }
    }
}

#[cfg(test)]
mod tests {
    mod utils;
    mod mocks {
        mod project;
    }
    mod test_slot_metadata;
    mod test_contract_metadata;
    mod test_component_library;
}
