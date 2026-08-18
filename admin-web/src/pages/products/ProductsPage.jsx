import { useState } from "react";
import {
  PlusIcon,
  PencilIcon,
  Trash2Icon,
  XIcon,
  ImageIcon,
} from "lucide-react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { productApi, categoryApi } from "../../lib/api";
import { getStockStatusBadge } from "../../lib/utils";
function ProductsPage() {
  const [showModal, setShowModal] = useState(false);
  const [editingProduct, setEditingProduct] = useState(null);
  const [formData, setFormData] = useState({
    title: "",
    category: "",
    price: "",
    stock: "",
    description: "",
    discount: "",
    is_featured: false,
  });
  const [images, setImages] = useState([]);
  const [imagePreviews, setImagePreviews] = useState([]);
  const queryClient = useQueryClient();
  const { data: productsData, isLoading: productsLoading } = useQuery({
    queryKey: ["products"],
    queryFn: productApi.getAll,
  });
  const products = productsData?.data || [];
  const { data: categoriesData, isLoading: categoriesLoading } = useQuery({
    queryKey: ["categories"],
    queryFn: categoryApi.getAll,
  });
  const categories = categoriesData?.data || [];
  const createProductMutation = useMutation({
    mutationFn: productApi.create,
    onSuccess: () => {
      closeModal();
      queryClient.invalidateQueries({ queryKey: ["products"] });
    },
    onError: (err) => alert("Failed to create product: " + err.message),
  });
  const updateProductMutation = useMutation({
    mutationFn: ({ id, formData }) => productApi.update({ id, formData }),
    onSuccess: () => {
      closeModal();
      queryClient.invalidateQueries({ queryKey: ["products"] });
    },
    onError: (err) => alert("Failed to update product: " + err.message),
  });
  const deleteProductMutation = useMutation({
    mutationFn: (id) => productApi.delete(id),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ["products"] }),
    onError: (err) => alert("Failed to delete product: " + err.message),
  });
  const handleRemoveImage = (index) => {
    setImagePreviews((prev) => prev.filter((_, i) => i !== index));
    setImages((prev) => prev.filter((_, i) => i !== index));
  };
  const closeModal = () => {
    setShowModal(false);
    setEditingProduct(null);
    setFormData({
      title: "",
      category: "",
      price: "",
      stock: "",
      description: "",
      discount: "",
      is_featured: false,
    });
    setImages([]);
    setImagePreviews([]);
  };
  const handleEdit = (product) => {
    if (!product.id) return alert("Invalid product. id missing.");
    setEditingProduct(product);
    setFormData({
      title: product.title || "",
      category: product.category?.id || "",
      price: product.price?.toString() || "",
      stock: product.stock?.toString() || "",
      description: product.description || "",
      discount: product.discount?.toString() || "",
      is_featured: product.is_featured || false,
    });
    setImagePreviews(product.images || []);
    setShowModal(true);
  };
  const handleImageChange = (e) => {
    const files = Array.from(e.target.files);
    if (files.length + imagePreviews.length > 3)
      return alert("Maximum 3 images allowed");
    imagePreviews.forEach((url) => {
      if (url.startsWith("blob:")) URL.revokeObjectURL(url);
    });
    setImages([...images, ...files]);
    setImagePreviews([
      ...imagePreviews,
      ...files.map((file) => URL.createObjectURL(file)),
    ]);
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    if (!editingProduct && images.length === 0)
      return alert("Please upload at least one image");
    const payload = new FormData();
    payload.append("title", formData.title);
    payload.append("description", formData.description);
    payload.append("price", formData.price);
    payload.append("stock", formData.stock);
    payload.append("discount", formData.discount || "0");
    payload.append("is_featured", formData.is_featured ? "1" : "0");
    payload.append("categoryId", formData.category);
    images.forEach((img) => payload.append("images", img));
    if (editingProduct) {
      updateProductMutation.mutate({
        id: editingProduct.id,
        formData: payload,
      });
    } else {
      createProductMutation.mutate(payload);
    }
  };
  if (productsLoading || categoriesLoading) {
    return (
      <div className="flex justify-center items-center h-64">
        <span className="loading loading-spinner loading-lg"></span>
      </div>
    );
  }
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold">Products</h1>
          <p className="text-base-content/70 mt-1">
            Manage your product inventory
          </p>
        </div>
        <button
          onClick={() => setShowModal(true)}
          className="btn btn-primary gap-2"
        >
          <PlusIcon className="w-5 h-5" /> Add Product
        </button>
      </div>
      <div className="grid grid-cols-1 gap-4">
        {products.map((product) => {
          const status = getStockStatusBadge(product.stock);
          return (
            <div key={product.id} className="card bg-base-100 shadow-xl">
              <div className="card-body flex flex-col md:flex-row items-center gap-6">
                <div className="avatar w-20">
                  <img
                    src={product.images[0]}
                    alt={product.title}
                    className="rounded-xl"
                  />
                </div>
                <div className="flex-1 w-full">
                  <div className="flex justify-between items-start">
                    <div className="flex items-center gap-2">
                      <h3 className="card-title">{product.title}</h3>
                      {product.is_featured && (
                        <div className="badge badge-primary text-sm">
                          Featured
                        </div>
                      )}
                    </div>
                    <div className={`badge ${status.class}`}>{status.text}</div>
                  </div>
                  <p className="text-base-content/70 text-sm mt-1">
                    {product.category?.title}
                  </p>
                  <div className="flex items-center gap-6 mt-4">
                    <div>
                      <p className="text-xs text-base-content/70">Price</p>
                      <p className="font-bold text-lg">Rs {product.price}</p>
                    </div>
                    <div>
                      <p className="text-xs text-base-content/70">Stock</p>
                      <p className="font-bold text-lg">{product.stock} units</p>
                    </div>
                  </div>
                </div>
                <div className="card-actions">
                  <button
                    className="btn btn-square btn-ghost"
                    onClick={() => handleEdit(product)}
                  >
                    <PencilIcon className="w-5 h-5" />
                  </button>
                  <button
                    className="btn btn-square btn-ghost text-error"
                    onClick={() => {
                      if (
                        window.confirm(
                          `Are you sure you want to delete "${product.title}"?`,
                        )
                      ) {
                        deleteProductMutation.mutate(product.id);
                      }
                    }}
                  >
                    {deleteProductMutation.isPending ? (
                      <span className="loading loading-spinner"></span>
                    ) : (
                      <Trash2Icon className="w-5 h-5" />
                    )}
                  </button>
                </div>
              </div>
            </div>
          );
        })}
      </div>
      <input
        type="checkbox"
        className="modal-toggle"
        checked={showModal}
        readOnly
      />
      <div className="modal">
        <div className="modal-box max-w-2xl">
          <div className="flex items-center justify-between mb-4">
            <h3 className="font-bold text-2xl">
              {editingProduct ? "Edit Product" : "Add New Product"}
            </h3>
            <button
              onClick={closeModal}
              className="btn btn-sm btn-circle btn-ghost"
            >
              <XIcon className="w-5 h-5" />
            </button>
          </div>
          <form onSubmit={handleSubmit} className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <div className="form-control">
                <label className="label">
                  <span>Product Name</span>
                </label>
                <input
                  type="text"
                  placeholder="Enter product name"
                  className="input input-bordered"
                  value={formData.title}
                  onChange={(e) =>
                    setFormData({ ...formData, title: e.target.value })
                  }
                  required
                />
              </div>
              <div className="form-control">
                <label className="label">
                  <span>Category</span>
                </label>
                <select
                  className="select select-bordered"
                  value={formData.category}
                  onChange={(e) =>
                    setFormData({ ...formData, category: e.target.value })
                  }
                  required
                >
                  <option value="">Select category</option>
                  {categories.map((category) => (
                    <option key={category.id} value={category.id}>
                      {category.title}
                    </option>
                  ))}
                </select>
              </div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="form-control">
                <label className="label">
                  <span>Price (Rs)</span>
                </label>
                <input
                  type="number"
                  step="0.01"
                  placeholder="0.00"
                  className="input input-bordered"
                  value={formData.price}
                  onChange={(e) =>
                    setFormData({ ...formData, price: e.target.value })
                  }
                  required
                />
              </div>
              <div className="form-control">
                <label className="label">
                  <span>Stock</span>
                </label>
                <input
                  type="number"
                  placeholder="0"
                  className="input input-bordered"
                  value={formData.stock}
                  onChange={(e) =>
                    setFormData({ ...formData, stock: e.target.value })
                  }
                  required
                />
              </div>
            </div>
            <div className="form-control flex flex-col gap-2">
              <label className="label">
                <span>Description</span>
              </label>
              <textarea
                className="textarea textarea-bordered h-24 w-full"
                placeholder="Enter product description"
                value={formData.description}
                onChange={(e) =>
                  setFormData({ ...formData, description: e.target.value })
                }
                required
              />
            </div>
            <div className="form-control">
              <label className="label flex flex-col gap-1">
                <span className="label-text font-semibold flex items-center gap-2">
                  <ImageIcon className="h-5 w-5" /> Product Images
                </span>
                <span className="label-text-alt text-xs opacity-60">
                  Max 3 images
                </span>
              </label>
              <input
                type="file"
                accept="image/*"
                multiple
                onChange={handleImageChange}
                className="file-input file-input-bordered file-input-primary w-full"
                required={!editingProduct}
              />
              {imagePreviews.length > 0 && (
                <div className="flex flex-wrap gap-2 mt-2">
                  {imagePreviews.map((preview, index) => (
                    <div key={index} className="relative w-20 h-20">
                      <button
                        type="button"
                        onClick={() => handleRemoveImage(index)}
                        className="absolute top-0 right-0 z-10 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs hover:bg-red-600"
                      >
                        ×
                      </button>
                      <img
                        src={preview}
                        alt={`Preview ${index + 1}`}
                        className="w-full h-full object-cover rounded-lg"
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="form-control">
                <label className="label">
                  <span>Discount (%)</span>
                </label>
                <input
                  type="number"
                  min="0"
                  max="100"
                  placeholder="0"
                  className="input input-bordered"
                  value={formData.discount}
                  onChange={(e) =>
                    setFormData({ ...formData, discount: e.target.value })
                  }
                />
              </div>
              <div className="form-control">
                <label className="label cursor-pointer">
                  <span className="label-text">Featured Product</span>
                  <input
                    type="checkbox"
                    className="checkbox checkbox-primary"
                    checked={formData.is_featured}
                    onChange={(e) =>
                      setFormData({
                        ...formData,
                        is_featured: e.target.checked,
                      })
                    }
                  />
                </label>
              </div>
            </div>
            <div className="modal-action">
              <button type="button" onClick={closeModal} className="btn">
                Cancel
              </button>
              <button
                type="submit"
                className="btn btn-primary"
                disabled={
                  createProductMutation.isPending ||
                  updateProductMutation.isPending
                }
              >
                {createProductMutation.isPending ||
                updateProductMutation.isPending
                  ? "Saving..."
                  : editingProduct
                    ? "Update Product"
                    : "Add Product"}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
export default ProductsPage;
