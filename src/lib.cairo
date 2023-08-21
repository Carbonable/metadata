mod interfaces {
    mod erc3525;
    mod project;
    mod slot_metadata;
    mod contract_metadata;
    mod erc165;
    mod component;
    mod component_provider;
}

mod components {
    mod component {
        mod carbonable_logo;
        mod sdgs {
            mod sdg01;
            mod sdg13;
            mod sdg14;
            mod sdg15;
        }
        mod jpegs {
            mod farmer;
        }
    }
    mod provider;
}

mod metadata {
    mod common {
        mod data;
        mod models;
        mod utils;
    }
    mod project {
        mod contract;
        mod data;
        mod generator;
    }
    mod slots {
        mod banegasfarm {
            mod contract;
            mod data;
        }
        mod template {
            mod slot;
            mod token {
                mod token;
                mod svg;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    mod utils {
        mod tests;
        mod contracts;
    }
    mod mocks {
        mod project;
    }
    mod test_slot_metadata;
    mod test_contract_metadata;
    mod test_component_provider;
}
