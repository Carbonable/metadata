use alexandria_ascii::ToAsciiTrait;

#[derive(Drop, Serde)]
struct Properties {
    x: Option<usize>,
    y: Option<usize>,
    width: Option<usize>,
    height: Option<usize>,
}

impl DefaultProps of Default<Properties> {
    fn default() -> Properties {
        Properties { x: Option::None, y: Option::None, width: Option::None, height: Option::None, }
    }
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

fn add_header_helper(props: Properties, ref data: Array<felt252>) {
    data.append('<svg');
    match props.x {
        Option::Some(x) => {
            data.append(' x=\\"');
            data.append(x.to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }
    match props.y {
        Option::Some(y) => {
            data.append(' y=\\"');
            data.append(y.to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }
    match props.width {
        Option::Some(width) => {
            data.append(' width=\\"');
            data.append(width.to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }
    match props.height {
        Option::Some(height) => {
            data.append(' height=\\"');
            data.append(height.to_ascii());
            data.append('\\"');
        },
        Option::None => (),
    }
}
