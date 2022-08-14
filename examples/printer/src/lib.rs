use pyo3::prelude::*;

#[pyfunction]
fn print(s: &str) {
    println!("{}", s);
}

/// This module is implemented in Rust.
#[pymodule]
fn printer(_py: Python<'_>, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(print, m)?)?;
    Ok(())
}
