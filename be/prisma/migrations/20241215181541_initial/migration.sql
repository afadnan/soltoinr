-- CreateEnum
CREATE TYPE "TransactionStatus" AS ENUM ('pending', 'success', 'failed');

-- CreateTable
CREATE TABLE "users" (
    "user_id" SERIAL NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "solanaWalletAddress" VARCHAR(44) NOT NULL,
    "balanceAccountNumber" TEXT NOT NULL,
    "upiId" VARCHAR(100) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "transactions" (
    "transaction_id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "solanaAmount" DECIMAL(20,10) NOT NULL,
    "inrAmount" DECIMAL(20,2) NOT NULL,
    "transactionStatus" "TransactionStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("transaction_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_solanaWalletAddress_key" ON "users"("solanaWalletAddress");

-- CreateIndex
CREATE UNIQUE INDEX "users_balanceAccountNumber_key" ON "users"("balanceAccountNumber");

-- CreateIndex
CREATE UNIQUE INDEX "users_upiId_key" ON "users"("upiId");

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;
