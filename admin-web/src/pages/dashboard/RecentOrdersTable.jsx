import {
  capitalizeText,
  formatDate,
  getOrderStatusBadge,
} from "../../lib/utils";
export function RecentOrdersTable({ orders }) {
  if (!orders || orders.length === 0)
    return (
      <div className="text-center py-8 text-gray-700 dark:text-gray-400">
        No orders yet
      </div>
    );
  return (
    <div className="overflow-auto rounded-xl border border-gray-300 bg-white">
      <table className="table min-w-[700px] table-auto">
        <thead className="bg-blue-100 text-black">
          {" "}
          <tr className="uppercase text-sm">
            <th className="px-4 py-3 text-left">Order ID</th>
            <th className="px-4 py-3 text-left">Users</th>
            <th className="px-4 py-3 text-left">Items</th>
            <th className="px-4 py-3 text-left">Amount</th>
            <th className="px-4 py-3 text-left">Status</th>
            <th className="px-4 py-3 text-left">Date</th>
          </tr>
        </thead>
        <tbody className="bg-white text-black">
          {orders
            .slice(0, 5)
            .sort(
              (a, b) =>
                new Date(b.created_at || b.createdAt) -
                new Date(a.created_at || a.createdAt),
            )
            .map((order) => (
              <tr
                key={order.id || order._id}
                className="border-t border-gray-300"
              >
                <td className="px-4 py-3 font-medium">
                  {order.id?.slice(-8)?.toUpperCase() ||
                    order._id?.slice(-8)?.toUpperCase()}
                </td>
                <td className="px-4 py-3">
                  <div>{order.userInfo?.name || "N/A"}</div>
                  <div className="text-sm text-gray-500">
                    {order.orderItems?.length || 0} item(s)
                  </div>
                </td>
                <td className="px-4 py-3">
                  {order.orderItems
                    ?.map((item, i) => (i < 2 ? item.title : null))
                    .filter(Boolean)
                    .join(", ")}
                  {order.orderItems?.length > 2 &&
                    ` +${order.orderItems.length - 2} more`}
                </td>
                <td className="px-4 py-3 font-semibold">
                  Rs {Number(order.totalPrice || 0).toLocaleString()}
                </td>
                <td className="px-4 py-3">
                  <div
                    className={`badge ${getOrderStatusBadge(order.status)} capitalize`}
                  >
                    {capitalizeText(order.status || "")}
                  </div>
                </td>
                <td className="px-4 py-3">
                  {formatDate(order.created_at || order.createdAt)}
                </td>
              </tr>
            ))}
        </tbody>
      </table>
    </div>
  );
}
