pub fn matmul(a: ndarray::ArrayView2<f32>, b: ndarray::ArrayView2<f32>) -> ndarray::Array2<f32> {
    let (m,n1) = a.dim();
    let (n2,k) = b.dim();
    assert!(n1 == n2);
    let mut c = ndarray::Array::zeros((m, k));
    ndarray::linalg::general_mat_mul(1.0, &a, &b, 1.0, &mut c);
    c
}
