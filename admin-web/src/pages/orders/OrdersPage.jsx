import { useState } from "react";
import { orderApi } from "../../lib/api";
import { formatDate } from "../../lib/utils";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
function OrdersPage() {
  const queryClient = useQueryClient();
  const [statusMap, setStatusMap] = useState({});
  const { data: ordersData, isLoading } = useQuery({
    queryKey: ["orders"],
    queryFn: orderApi.getAll,
  });
  const updateStatusMutation = useMutation({
    mutationFn: orderApi.updateStatus,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["orders"] });
      queryClient.invalidateQueries({ queryKey: ["dashboardStats"] });
    },
  });
  const orders = Array.isArray(ordersData)
    ? [...ordersData].sort(
        (a, b) => new Date(b.created_at) - new Date(a.created_at),
      )
    : [];
  const handleSelectChange = (orderId, value) => {
    setStatusMap((prev) => ({
      ...prev,
      [orderId]: value,
    }));
  };
  const handleUpdateClick = (orderId, currentStatus) => {
    const newStatus = statusMap[orderId] || currentStatus;
    updateStatusMutation.mutate({ orderId, status: newStatus });
  };
  return (
    <div className="space-y-6">
      <div className="flex flex-col gap-2">
        <h1 className="text-2xl font-bold">Orders</h1>
        <p className="text-base-content/70">Manage users orders</p>
      </div>
      <div className="card bg-base-100 rounded-2xl shadow-2xl">
        <div className="card-body">
          {isLoading ? (
            <div className="flex justify-center py-12">
              <span className="loading loading-spinner loading-lg" />
            </div>
          ) : orders.length === 0 ? (
            <div className="text-center py-12 text-base-content/60">
              <p className="text-xl font-semibold mb-2">No orders yet</p>
              <p className="text-sm">
                Orders will appear here once users make purchases
              </p>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="table">
                <thead>
                  <tr>
                    <th>Order ID</th>
                    <th>users</th>
                    <th>Items</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  {orders.map((order) => {
                    const totalQuantity =
                      order.orderItems?.reduce(
                        (sum, item) => sum + item.quantity,
                        0,
                      ) || 0;
                    const selectedStatus = statusMap[order.id] || order.status;
                    return (
                      <tr key={order.id}>
                        <td>
                          <span className="font-medium">
                            #{order.id?.slice(-8).toUpperCase()}
                          </span>
                        </td>
                        <td>
                          <div className="font-medium">
                            {order.userInfo?.name || "N/A"}
                          </div>
                          <div className="text-sm opacity-60">
                            {order.userInfo?.email || "-"}
                          </div>
                          <div className="text-sm opacity-60">
                            {order.shippingAddress?.city || "-"},{" "}
                            {order.shippingAddress?.state || "-"}
                          </div>
                        </td>
                        <td>
                          <div className="font-medium">
                            {totalQuantity} items
                          </div>
                          <div className="text-sm opacity-60">
                            {order.orderItems?.[0]?.title}
                            {order.orderItems?.length > 1 &&
                              ` +${order.orderItems.length - 1} more`}
                          </div>
                        </td>
                        <td>
                          <span className="font-semibold">
                            Rs {Number(order.totalPrice || 0).toFixed(2)}
                          </span>
                          <div className="text-xs opacity-60">
                            {order.paymentMethod} •{" "}
                            {order.isPaid ? "Paid" : "Unpaid"}
                          </div>
                        </td>
                        <td>
                          <select
                            value={selectedStatus}
                            onChange={(e) =>
                              handleSelectChange(order.id, e.target.value)
                            }
                            className="select select-sm w-32"
                            disabled={updateStatusMutation.isPending}
                          >
                            <option value="pending">Pending</option>
                            <option value="confirmed">Confirmed</option>
                            <option value="shipped">Shipped</option>
                            <option value="delivered">Delivered</option>
                            <option value="cancelled">Cancelled</option>
                          </select>
                        </td>
                        <td>
                          <span className="text-sm opacity-60">
                            {formatDate(order.created_at)}
                          </span>
                        </td>
                        <td>
                          <button
                            className="btn btn-sm btn-primary"
                            onClick={() =>
                              handleUpdateClick(order.id, order.status)
                            }
                            disabled={
                              updateStatusMutation.isPending ||
                              selectedStatus === order.status
                            }
                          >
                            {updateStatusMutation.isPending ? (
                              <span className="loading loading-spinner loading-xs" />
                            ) : (
                              "Update"
                            )}
                          </button>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
export default OrdersPage;
