#[derive(Drop, Serde, Default)]
struct Properties {
    mime_prefix: bool
}

fn parse_properties(args: Option<Span<felt252>>) -> Properties {
    let props: Properties = match args {
        Option::Some(props) => {
            let mut props = props;
            Serde::<Properties>::deserialize(ref props).unwrap()
        },
        Option::None => Default::default(),
    };
    props
}

fn add_mime_prefix(props: Properties, ref data: Array<felt252>) {
    if props.mime_prefix {
        data.append('data:image/jpeg;base64,');
    }
}
