import {
  IndianRupeeIcon,
  PackageIcon,
  ShoppingBagIcon,
  UsersIcon,
} from "lucide-react";
export function StatsCards({ stats }) {
  const statsCards = [
    {
      name: "Total Revenue",
      value: `Rs ${Number(stats.totalRevenue || 0).toLocaleString()}`,
      icon: <IndianRupeeIcon className="w-8 h-8 text-[#FFF]" />,
      bg: "bg-gradient-to-r from-green-400 to-green-200 dark:from-green-600 dark:to-green-500",
    },
    {
      name: "Total Products",
      value: stats.numProducts || 0,
      icon: <PackageIcon className="w-8 h-8 text-[#37A6BF]" />,
      bg: "bg-[#E0F4FB] dark:bg-gray-700",
    },
    {
      name: "Average Price",
      value: `Rs ${Number(stats.avgPrice || 0).toFixed(2)}`,
      icon: <ShoppingBagIcon className="w-8 h-8 text-[#37A6BF]" />,
      bg: "bg-[#E0F4FB] dark:bg-gray-700",
    },
    {
      name: "Units Sold",
      value: stats.totalUnitsSold || 0,
      icon: <UsersIcon className="w-8 h-8 text-[#37A6BF]" />,
      bg: "bg-[#E0F4FB] dark:bg-gray-700",
    },
  ];
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
      {statsCards.map((stat) => (
        <div
          key={stat.name}
          className={`flex items-center p-6 rounded-2xl shadow-lg hover:shadow-2xl transition-transform transform hover:scale-105 ${stat.bg}`}
        >
          <div className="p-3 rounded-full bg-white/20 mr-4">{stat.icon}</div>
          <div>
            <div className="text-sm font-medium text-gray-700 dark:text-gray-300">
              {stat.name}
            </div>
            <div className="text-2xl font-bold text-gray-900 dark:text-gray-100 mt-1">
              {stat.value}
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}
