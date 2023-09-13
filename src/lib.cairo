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
    mod configs {
        mod svg;
    }
    mod component {
        mod logos {
            mod carbonable;
            mod ers;
        }
        mod sdgs {
            mod sdg01;
            mod sdg02;
            mod sdg03;
            mod sdg04;
            mod sdg05;
            mod sdg06;
            mod sdg07;
            mod sdg08;
            mod sdg09;
            mod sdg10;
            mod sdg11;
            mod sdg12;
            mod sdg13;
            mod sdg14;
            mod sdg15;
            mod sdg16;
            mod sdg17;
        }
        mod jpegs {
            mod farmer;
        }

        mod sft {
            mod progress_bar;
            mod status;
            mod border;
            mod badges {
                mod badge_Infty;
                mod badge_L;
                mod badge_M;
                mod badge_S;
                mod badge_XL;
                mod badge_XS;
            }
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
                mod data;
                mod generate;
                mod storage;
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
