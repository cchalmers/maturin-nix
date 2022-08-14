use numpy::convert::IntoPyArray;
use numpy::pyo3::prelude::*;

#[pyfunction]
fn matmul<'py>(py: Python<'py>, a: numpy::PyReadonlyArray2<f32>, b: numpy::PyReadonlyArray2<f32>) -> &'py numpy::PyArray2<f32> {
    mm::matmul(a.as_array(), b.as_array()).into_pyarray(py)
}

#[pyfunction]
fn mat<'py>(py: Python<'py>, a: f32, b: f32, c: f32, d: f32) -> &'py numpy::PyArray2<f32> {
    ndarray::array![[a,b], [c,d]].into_pyarray(py)
}

/// This module is implemented in Rust.
#[pymodule]
fn mmpy(_py: Python<'_>, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(matmul, m)?)?;
    m.add_function(wrap_pyfunction!(mat, m)?)?;
    Ok(())
}
